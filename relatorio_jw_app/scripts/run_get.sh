BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"

get_dependencies_all_modules() {
  printf "${BLUE}" 'Starting to run pub get in all modules'
  cd ..
  for dir in relatorio*/; do
    if [ -d "$dir" ]; then
      printf "${GREEN}" "Running pub get in: $dir"
      cd $dir

      if ! flutter pub get; then
        printf "${RED}" "Failed pub get in: $dir"
        return 1
      fi

      cd -
    else
      printf "${RED}" "No found folder: $dir"
    fi
  done

  printf "${GREEN}" "Ran pub get in all modules with success"
  return 0
}

get_dependencies_all_modules