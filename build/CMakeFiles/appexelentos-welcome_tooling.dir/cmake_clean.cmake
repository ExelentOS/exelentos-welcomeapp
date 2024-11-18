file(REMOVE_RECURSE
  "exelentos-welcome/resources/Main.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/appexelentos-welcome_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
