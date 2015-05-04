-- Map: key-value pair collection
import Data.Map

main = do
    -- printing a singleton map:
    let singletonMap = singleton 97 'a'
    print "singleton map:"
    print singletonMap

    -- printing an empty map:
    let emptyMap = delete 97 singletonMap
    print "empty map:"
    print emptyMap

    -- printing a map consisting of multiple items:
    let multipleItemsMap = insert 98 'b' (insert 99 'c' singletonMap)
    print "multiple items in a map:"
    print multipleItemsMap

    -- printing an union of maps:
    let unionMap = union (insert 33 '3' (insert 32 '2' (singleton 31 '1'))) multipleItemsMap
    print "union of maps:"
    print unionMap

    -- printing the size of a map:
    print ("this map is of size: " ++ (show (size unionMap)))

    -- querying for a map member:
    print ("is 'a'/97 in the map? " ++ (show (member 97 unionMap)))
    print ("is '4'/34 in the map? " ++ (show (member 34 unionMap)))
