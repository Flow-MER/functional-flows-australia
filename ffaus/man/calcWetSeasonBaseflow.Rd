% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wet_season_baseflow.R
\name{calcWetSeasonBaseflow}
\alias{calcWetSeasonBaseflow}
\title{Wet season baseflow summary}
\usage{
calcWetSeasonBaseflow(
  flow_matrix,
  wet_timings,
  recession_timings,
  dry_season_start_dates,
  do_plot = 1
)
}
\arguments{
\item{flow_matrix}{a 'by date' row data frame with 2 columns named (Date, Flow).}

\item{wet_timings}{The water year date for each water year in which the flow is beginning to
return to its wetter period. Computed using returnToWetDate().}

\item{recession_timings}{The water year date for each water year in which the flow initiation
is computed to have begun. Corresponds typically to first substantial
peak in the hydrograph post dry-season. Computed using
calcFlowInitiationFlushTimingsDurations().}

\item{dry_season_start_dates}{the water year date for each water year in which the dry-season is
computed to have begun. Computed using calcStartOfdry_season().}

\item{do_plot}{should diagnostic plots be generated? 1 = yes, 0 = no.}
}
\value{
A list with two data frame elements of size 1 by no. water years
\itemize{
\item wet_baseflows_10 - 10th percentile of the flow data between the wet season start date and recession start date.
\item wet_baseflows_50 - 50th percentile of the flow data between the wet season start date and recession start date.
\item wet_bfl_durs     - number of water years days between wet season start date and recession start date.
}
}
\description{
Summarises the wet season baseflow magnitude and duration.
}
