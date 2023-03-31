BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"

clean_only_module() {
  printf "${BLUE}" 'Starting to run clean in module'
  cd ..
  for dir in relatorio_jw_app/; do
    if [ -d "$dir" ]; then
      printf "${GREEN}" "Running clean in: $dir"
      cd $dir

      if ! flutter clean; then
        printf "${RED}" "Failed clean in: $dir"
        return 1
      fi

      cd -
    else
      printf "${RED}" "No found folder: $dir"
    fi
  done

  printf "${GREEN}" "All modules cleaned with success"
  return 0
}

clean_only_module
