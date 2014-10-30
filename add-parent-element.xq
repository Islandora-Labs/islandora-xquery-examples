declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";

copy $xml := .
modify (

for $topic in $xml/mods/topic
  return replace node $topic with <subject>{ $topic }</subject>,

for $geographic in $xml/mods/geographic
return replace node $geographic with <subject>{ $geographic }</subject>,

for $temporal in $xml/mods/temporal
return replace node $temporal with <subject>{ $temporal }</subject>,

for $hierarchicalGeographic in $xml/mods/hierarchicalGeographic
return replace node $hierarchicalGeographic with <subject>{ $hierarchicalGeographic }</subject>,

for $cartographics in $xml/mods/cartographics
return replace node $cartographics with <subject>{ $cartographics }</subject>


)
return  $xml
