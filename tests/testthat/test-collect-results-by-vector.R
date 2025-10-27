test_that("collect-results-by-vector gives error with wrong column name", {
  
  expect_error(collect_results_by_vector(query_col = "labbno", 
                            query_vector = c("24024388"),
                            output_cols = c("labbno")))
  
})
