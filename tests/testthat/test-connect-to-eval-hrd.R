test_that("connect_to_eval_hrd returns a tibble", {
  
  eval_hrd <- connect_to_eval_hrd()
  
  expect_true(tibble::is_tibble(eval_hrd))
  
})

test_that("connect_to_eval_hrd returns correct dimensions", {
  
  eval_hrd <- connect_to_eval_hrd()
  
  expect_true(ncol(eval_hrd) == 8)
  
  expect_true(nrow(eval_hrd) > 15000)
  
})
