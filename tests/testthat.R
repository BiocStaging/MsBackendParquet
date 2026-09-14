library(testthat)
library(MsBackendParquet)

test_check("MsBackendParquet")

## Run the unit test for MsBackend implementation from the Spectra package
## to verify compliance.
library(MsDataHub)
fls <- PestMix1_DDA.mzML()

d <- tempdir()
createMsBackendParquetDataset(d, fls)
be <- backendInitialize(MsBackendParquet(), d)

test_suite <- system.file("test_backends", "test_MsBackend",
                          package = "Spectra")
test_dir(test_suite, stop_on_failure = TRUE)
