# ==============================================================================
# Script for uses to quickly install and run a test data set using ffaus R
# package
# Author: Luke Lloyd-Jones, luke.lloyd-jones@csiro.au
# ==============================================================================

# Need devtools installed
install.packages("devtools")
library(devtools)

# Install
devtools::install("ffaus/")

# Load library
library(ffaus)

# ----------------
# Run a test gauge
# ----------------

# Load the test data set that was breaking
# These test data were from an in-stream gauge in the
# Lachlan, Australia. The data span nearly 50 years

lch.tst <- read.table("data/Lachlan@Jemalong_Weir_412036.txt", 
                      header = T, sep = "\t")
flow_matrix   <- lch.tst
flow_type     <- "sra"
out_file      <- "test/sra_test_19_04_22/"


# Initiate the default parameters. These are the parameters passed to
# the function getFFMetrics(). See ?getFFMetrics for more details.

spc_set       <- list(dry_max_peak_flow_date        = 250, 
                      dry_sensitivity               = 800, 
                      min_dry_season_flow_percent   = 0.125, 
                      init_broad_sigma              = 15, 
                      last_date_cutoff_initiation   = 152, 
                      wet_peak_detect_perc          = 0.30, 
                      recess_init_timing_cutoff     = 80, 
                      recess_peak_filter_percentage = 0.5)

# These can be adjusted if when running the code fails.

spc_set$dry_max_peak_flow_date    <- 100
spc_set$recess_init_timing_cutoff <- 70

# Stipulate where you would like the diagnostics plots to be written to.
dir.create("test")

plot_out_base <- "test/Lachlan@Jemalong_Weir_412036"

# Run the functional flows metric calculator. CAUTION MANY PLOTS WILL BE
# WRITTEN TO THE TEST FOLDER.

out_metrics_obs <- getFFMetrics(flow_matrix, 
                                plot_out_base                 = plot_out_base, 
                                dry_max_peak_flow_date        = spc_set$dry_max_peak_flow_date,
                                dry_sensitivity               = spc_set$dry_sensitivity,
                                min_dry_season_flow_percent   = spc_set$min_dry_season_flow_percent,
                                init_broad_sigma              = spc_set$init_broad_sigma,
                                last_date_cutoff_initiation   = spc_set$last_date_cutoff_initiation,
                                wet_peak_detect_perc          = spc_set$wet_peak_detect_perc,
                                recess_init_timing_cutoff     = spc_set$recess_init_timing_cutoff,
                                recess_peak_filter_percentage = spc_set$recess_peak_filter_percentage, 
                                do_plot     = 1, 
                                plot_width  = 25, 
                                plot_height = 15,
                                mfrow_rw    = 5,
                                mfrow_cl    = 5)

head(out_metrics_obs)

# These can be written out for later reference. See pdf documentation for 
# deep description of the metrics written to this file.

write.csv(out_metrics_obs$FFmetrics, 
          file = paste0(plot_out_base, "_ff_metrics.csv"))




