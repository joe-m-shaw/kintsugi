test_that("collect_seqone_gi_worksheets() returns a dataframe", {
  
  x <- collect_seqone_gi_worksheets()
  
  expect_true(ncol(x) == 4 &
                nrow(x) > 100)
})

