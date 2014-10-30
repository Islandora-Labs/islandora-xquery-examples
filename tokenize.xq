(: this xquery turns

<mods><subject>
<topic>lion; bird; cat; dog</topic>
</subject></mods>

into

<mods><subject>
<topic>lion</topic>
<topic>bird</topic>
<topic>cat</topic>
<topic>dog</topic>
</subject></mods>  :)

declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";
 
 
copy $xml := .
modify (
  let $topic := $xml/mods/subject/topic
  return replace node $topic with
    for $token in tokenize($topic, '; ')
    return <topic>{ $token }</topic>
)
return $xml