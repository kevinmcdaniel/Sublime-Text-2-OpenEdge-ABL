/* syntax test file for oeABL syntax highlighting */

// code includes
{pt/shared}
{in/ohu11 "test" "himom"}
{&OUT} {&if this is tru 'himom'}. // prepocessors

// comments
/* test comment */
/* test comment /* with embedded comment which is an error.  don't do this. */
** but you have to close the commetn in pairs */
// added double slash for this test file - not really supported by open edge.

// constants and operators
#123456 // HTML color
#abcdef // HTML color
12      // integer
12.123  // decimal
ab23 12ab. // mixed with letters - no highlight
 =  eq  <  lt  >  gt  <=  le  >=  ge  <>   // boolean
 and false no not of on or to true yes // constants
 + - * / // math

 // not sure about these....
. :

define new global shared static variable vAbc as character format "x(20)" no-undo.

define private variable vPrivateAbc like item.item-no no-undo.


// conditional statmets
if vAbc > 1
then
  message 'himom'.
else
  message 'byemom'.

// functions - keywords
integer decimal upper lower

main-block:
mainblock:

  constructor public role
             (iFieldList as character
             ,iWSession  as dao.wsession
             ):
    super(iFieldList,iWSession).
    initClass().
  end constructor.

  method override character getNextKeyValue():
    vQueryString = 'preselect each esRole no-lock by esRole.roleId descending'.
    openRealQuery().
    if hRealQuery:num-results = 0
    then
      return '101'.
    else
    do:
      hRealQuery:get-first().
      return string(hRealQuery:get-buffer-handle(1):buffer-field('roleId'):buffer-value + 1).
    end.
  end method. /* getNextKeyValue */
