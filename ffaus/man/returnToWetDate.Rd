% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flow_initiation.R
\name{returnToWetDate}
\alias{returnToWetDate}
\title{Return to wet date.}
\usage{
returnToWetDate(
  flow_data,
  wet_season_filter_data,
  broad_filter_data,
  slope_detection_data,
  wet_threshold_perc,
  peak_detect_perc,
  peak_sensitivity_wet,
  slope_sensitivity,
  last_wet_date
)
}
\arguments{
\item{flow_data}{Flow data for a particular water year. Typically a vector of size 1 by 365/366.}

\item{wet_season_filter_data}{Smoothed (larger standard deviation filter default = 12) flow data for a particular water year. Typically a vector of size 1 by 365/366.}

\item{broad_filter_data}{Smoothed (medium standard deviation filter default = 15) flow data for a particular water year. Typically a vector of size 1 by 365/366.}

\item{slope_detection_data}{Smoothed (small standard deviation filter default = 2) flow data for a particular water year. Typically a vector of size 1 by 365/366.}

\item{wet_threshold_perc}{Return to wet season flow must be 'this' percentage of that year's max flow.}

\item{peak_detect_perc}{The peak percentage of max flow identified to search before for wet season initiation.}

\item{peak_sensitivity_wet}{Sensitivity of peak detection algorithm for when detecting peaks of wet-season smoothed data.}

\item{slope_sensitivity}{Sets sensitivity of slope threshold for wet season start time.}

\item{last_wet_date}{the final date in which the wet season can begin. Usually take to be the dry-season start date.}
}
\value{
A numeric water year day corresponding to the start date of the wet season.
}
\description{
Calculate the return to wet date, which signals the return to a wetter period
of each water year following the dry season.
}
