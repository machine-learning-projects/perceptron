# perceptron

Online, biased perceptron algorithm.
Takes as input feature vectors representing economics articles. Each attribute corresponds to a word stem found in the set of training documents. The value of a feature is the tf-idf count of that word in the document. Vectors have been normalized to Euclidean length 1.

There are 47,236 distinct word stems, most of which are zero, and thus provided in sparse format. Each row has 3 columns: pattern index, attribute index, attribute value. 0-values features are not specified.
