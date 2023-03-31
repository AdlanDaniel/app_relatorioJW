BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
YELLOW="\e[33;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"

analyze_all_modules() {
  printf "${BLUE}" 'Starting running analyze in all modules'
  cd ..
  for dir in relatorio*/; do
    if [ -d "$dir" ]; then
      printf "${GREEN}" "Running analyze in: $dir"
      cd $dir

      if ! flutter analyze --no-fatal-infos; then
        printf "${RED}" "Failed analyze in: $dir"
        return 1
      fi

      cd -
    else
      printf "${RED}" "No found folder: $dir"
    fi
  done

  printf "${GREEN}" "All modules analyzed with success"
  return 0
}

analyze_all_modules
