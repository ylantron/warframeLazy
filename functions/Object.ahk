class Object {
    
    getLength(element) {
        totElements := 0

        for i, val in element {
            totElements++
        }

        return totElements
    }

    isLinear(arr) {
        i := 0
        
        for j, val in arr {
            if (++i != j) {
                return 0
            }
        }
        
        return 1
    }
}