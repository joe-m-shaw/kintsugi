
connect_to_sql_server <- function(db = "moldb") {
  
  #' Connect to the Microsoft SQL Server
  #'
  #' @param db The database to connect to. Defaults to "moldb" which is the
  #' mirror version of DNA Database.
  #'
  #' @returns A DBI connection to the database
  #' @export
  #'

  DBI::dbConnect(
    drv = odbc::odbc(),
    dsn = db)
  
}

