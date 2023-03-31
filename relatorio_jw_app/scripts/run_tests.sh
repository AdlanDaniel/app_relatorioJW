BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"

tests_all_modules() {
  printf "${BLUE}" 'Starting to run tests in all modules'
  cd ..

  # remove joined cov files 
  if [ -d "coverage_report/" ]; then
    rm -rf coverage_report
  fi

  for dir in relatorio*/; do
    if [ -d "$dir" ]; then
      printf "${BLUE}" "Running test in: $dir"
      cd $dir

      if ! flutter test --coverage; then
        printf "${RED}" "Failed test in: $dir"
        return 1
      fi

      lcov -q --remove coverage/lcov.info "**/*.g.dart" -o coverage/lcov.info
      CODE_COVERAGE=$(lcov -q --list coverage/lcov.info | sed -n "s/.*Total:|\([^%]*\)%.*/\1/p")

      if [ -e min.cov ]; then
        MIN_COVERAGE=$(cat min.cov)
        printf "${GREEN}" "Minimum Coverage Required: ${MIN_COVERAGE}%"

        if (($(echo "$CODE_COVERAGE < $MIN_COVERAGE" | bc))); then
          printf "${RED}" "Current Code Coverage: ${CODE_COVERAGE}%"
          if [[ -z "$DO_NOT_EXIT_ON_COVERAGE" ]]; then
            exit 1
          fi
        else
          printf "${GREEN}" "Current Code Coverage: ${CODE_COVERAGE}%"
        fi
      fi

      cd -
      
      # join cov files
      if [ ! -d "coverage_report" ]; then
        mkdir "coverage_report"
      fi
      sed "s/^SF:lib/SF:${dir%?}\/lib/g" $dir/coverage/lcov.info >> "coverage_report/lcov.info"

    else
      printf "${RED}" "No found test in: $dir"
    fi
  done

  printf "${GREEN}" "Passed all tests"
  return 0
}

tests_all_modules
