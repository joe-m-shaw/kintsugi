test_that("read_seqone_gi_csv works for a standard sample", {
  
  test_filepath <- "test_data/WS123456_12345678_hrd-results.csv"
  
  expected_tibble <- tibble::tibble(
    "sample"	 = "WS123456_12345678",
    "analysis_date"	= "08/10/2025",
    "somahrd_version"	= "v1.2.13",
    "lga"	= 11,
    "lpc" = 2,	
    "score"	= 0.3,
    "status"	= factor(x = "Negative",
                      levels = c("Positive", "Negative",
                                 "Non-conclusive")),
    "brca_status"	= NA,
    "brca_mutation"	= NA,
    "ccne1_cn"	= 2,
    "rad51b_cn"	= 4,
    "coverage"	= 1,
    "pct_mapped_reads"	= 0.99,
    "pct_tum_cell"	= 0.31,
    "gi_confidence"	= 0.98,
    "low_tumor_fraction" =1,
    "filepath" = test_filepath,
    "date" = lubridate::parse_date_time(x = "08/10/2025",
                                        orders = c("dmy"))
  )
  
  expect_equal(read_seqone_gi_csv(test_filepath),
               expected = expected_tibble)
  
})





