xquery version "3.0" encoding "UTF-8";
declare namespace mods="http://www.loc.gov/mods/v3";
copy $input := .
modify (
for $text in $input
return insert node <mods:note type="funding">This project was supported by a research grant issued by York University Libraries.</mods:note> into $text//mods:mods
)
return $input