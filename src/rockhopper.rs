//! CLI rockhopper tool

extern crate getopts;
extern crate rockhopper;

use die::{Die, die};
use std::env;

/// CLI entrypoint
fn main() {
    let brief: String = format!(
        "Usage: {} [<OPTIONS>] [-- <ROCKLET_OPTIONS>]",
        env!("CARGO_PKG_NAME")
    );

    let mut opts: getopts::Options = getopts::Options::new();
    opts.optflag("c", "clean", "remove artifacts");
    opts.optflag("d", "debug", "enable additional logging");
    opts.optflag("q", "quiet", "reduce logging");
    opts.optflag("h", "help", "usage operation. print usage info");
    opts.optflag("v", "version", "version operation. print version info");

    let usage: String = opts.usage(&brief);
    let arguments: Vec<String> = env::args().collect();
    let optmatches: getopts::Matches = opts.parse(&arguments[1..]).die(&usage);

    if !optmatches.free.is_empty() {
        die!(usage);
    }

    if optmatches.opt_present("h") {
        die!(0; usage);
    }

    if optmatches.opt_present("v") {
        die!(0; format!("{} {}", env!("CARGO_PKG_NAME"), env!("CARGO_PKG_VERSION")));
    }

    let mut rh = match rockhopper::Rockhopper::load(rockhopper::CONFIGURATION_FILENAME) {
        Err(e) => die!(1; format!("error: {e}")),
        Ok(e) => e,
    };

    if optmatches.opt_present("q") {
        rh.log_level = Some(rockhopper::LogLevel::Quiet);
    }

    if optmatches.opt_present("d") {
        rh.log_level = Some(rockhopper::LogLevel::Debug);
    }

    rh.rocklet_args = optmatches.free.clone();

    if let Some(rockhopper::LogLevel::Debug) = rh.log_level {
        eprintln!("debug: configuration: {:?}", rh);
    }

    if optmatches.opt_present("c")
        && let Err(e) = rh.clean()
    {
        die!(1; format!("error: {e}"));
    }

    if let Err(e) = rh.build() {
        die!(1; format!("error: {e}"));
    }
}
