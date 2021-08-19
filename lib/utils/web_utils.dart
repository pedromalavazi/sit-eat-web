fontSize(double size, {double min = 10, double max = 22}) {
  if (size < min) {
    return min;
  } else if (size > max) {
    return max;
  }
  return size;
}
