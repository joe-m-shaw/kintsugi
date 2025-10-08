test_that("pivot_wider_by_test gives warning for an empty table", {
  
  eval_hrd <- connect_to_eval_hrd()
  
  expect_warning(pivot_wider_by_test(df = eval_hrd,
                                      test_vector = c("Panel which doesn't exist"), 
                                      names_prefix = "x"),
    regexp = "Output dataframe has 0 rows")
  
})



