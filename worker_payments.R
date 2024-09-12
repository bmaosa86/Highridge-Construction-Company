set.seed(123)
# Initialize the worker list
workers <- list()
# Populate the list dynamically
for (i in 1:400) {
  worker <- list(
    id = i,
    name = paste0("worker_", i),
    salary = sample(5000:30000, 1),
    gender = sample(c("Male", "Female"), 1)
  )
}
# Generate Payment Slips
for (worker in workers) {
  trycatch({
    salary <- worker$salary
    gender <- worker$gender
    # conditional statements for Employee level
    if (salary > 1000 & salary < 20000) {
      worker$level <- "A1"
    }
    if (salary > 7500 & salary < 30000 & gender == "Female") {
      worker$level <- "AF-5"
    }
    print(paste("Payment Slip for", worker$name, ":"))
    print (paste("ID:", worker$id))
    print(paste("Salary: &", salary))
    print(paste("Level:", ifelse(is.null(worker$level), "Not Assigned",worker$level)))
    print("-----------------------------")
  }, error = function(e) {
    print(paste("Error processing payment slip for", worker$name, ":", e$message))
  })
}

