-- Set: unordered collection
import Data.Set

main = do
    -- printing a singleton set:
    let singletonSet = singleton 'a'
    print "singleton set:"
    print singletonSet

    -- printing an empty set:
    let emptySet = delete 'a' singletonSet
    print "empty set:"
    print emptySet

    -- printing a set consisting of multiple items:
    let multipleItemsSet = insert 'b' (insert 'c' singletonSet)
    print "multiple items in a set:"
    print multipleItemsSet

    -- printing an union of sets:
    let unionSet = union (insert '3' (insert '2' (singleton '1'))) multipleItemsSet
    print "union of sets:"
    print unionSet

    -- querying for a set member:
    print ("is 'a' in the union? " ++ (show (member 'a' unionSet)))
    print ("is '4' in the union? " ++ (show (member '4' unionSet)))
