BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"

format_all_modules() {
  printf "${BLUE}" 'Starting to run format in all modules'
  cd ..
  for dir in relatorio*/; do
    if [ -d "$dir" ]; then
      printf "${GREEN}" "Running format in: $dir"
      cd $dir

      if ! flutter format .; then
        printf "${RED}" "Failed format in: $dir"
        return 1
      fi

      cd -
    else
      printf "${RED}" "No found folder: $dir"
    fi
  done

  printf "${GREEN}" "All modules formatted with success"
  return 0
}

format_all_modules
