-- Seq: ordered collection
import Data.Sequence

main = do
    -- printing a singleton seq:
    let singletonSeq = singleton 'b'
    print "singleton seq:"
    print singletonSeq

    -- printing an empty seq:
    let emptySeq = Data.Sequence.drop 1 singletonSeq
    print "empty seq:"
    print emptySeq

    -- printing a seq consisting of multiple items:
    let multipleItemsSeq = ('a' <| singletonSeq) |> 'c'
    print "multiple items in a seq:"
    print multipleItemsSeq

    -- printing an union of seqs:
    let unionSeq = (((singleton '1') |> '2') |> '3') >< multipleItemsSeq
    print "union of seq:"
    print unionSeq

    -- printing the size of a seq:
    print ("this seq is of size: " ++ (show (Data.Sequence.length unionSeq)))
