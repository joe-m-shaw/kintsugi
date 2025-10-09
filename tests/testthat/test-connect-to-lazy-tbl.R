test_that("connect_to_lazy_tbl returns lazy table", {
  
  samples_tbl <- connect_to_lazy_tbl("Samples")
  
  expect_true(ncol(samples_tbl) == 56)
  
})
