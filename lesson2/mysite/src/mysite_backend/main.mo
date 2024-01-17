import Array "mo:base/Array";
actor {

  func quicksort(arr : [var Int], low : Nat, high : Nat) {
    if (low >= high) {
      return;
    };

    var temp = arr[low];
    var left = low;
    var right = high;
    while (left < right) {
      while (arr[right] >= temp and right > left) {
        right -= 1;
      };

      arr[left] := arr[right]; // swap 1/3

      while (arr[left] <= temp and left < right) {
        left += 1;
      };

      arr[right] := arr[left]; // swap 2/3
    };

    arr[right] := temp; // swap 3/3

    if (left >= 1) {
      quicksort(arr, low, left -1);
    } else {
      quicksort(arr, left +1, high);
    };

  };

  public func qsort(arr : [Int]) : async [Int] {
    var newArr : [var Int] = Array.thaw(arr);
    quicksort(newArr, 0, newArr.size() -1);
    let retArray : [Int] = Array.freeze(newArr);
    return retArray;
  };

};
