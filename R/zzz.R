mclustStartupMessage <- function()
{
  # Startup message obtained as
  # > figlet -f slant MCLUST
  msg <- c(paste0(
    "\nWelcome to:\n",
    " _____  _   _  _   _ __   __
|  ___|| \\ | || | | |\\ \\ / /
| |__  |  \\| || | | | \\ V /
|  __| | . ` || | | | /   \\
| |___ | |\\  |\\ \\_/ // /^\\ \\
\\____/ \\_| \\_/ \\___/ \\/   \\/  version ",
    packageVersion("envx")),
    "\n\nFor tutorials, type `list_tutorials()`\n")
  return(msg)
}

.onAttach <- function(lib, pkg)
{
  # unlock .mclust variable allowing its modification
  # startup message
  msg <- mclustStartupMessage()
  if(!interactive())
    msg[1] <- paste("Package 'envx' version", packageVersion("envx"))
  packageStartupMessage(msg)
  invisible()
}
