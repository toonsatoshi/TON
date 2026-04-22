// Fixed-point math helpers.

const WAD: Int = 1000000000000000000;
const LN2_WAD: Int = 693147180559945309;

fun mulDiv(a: Int, b: Int, c: Int): Int {
  require(c != 0, 201);
  return (a * b) / c;
}

fun sqrt(x: Int): Int {
  require(x >= 0, 202);

  if (x < 2) {
    return x;
  }

  let z: Int = x;
  let y: Int = (x / 2) + 1;

  while (y < z) {
    z = y;
    y = ((x / y) + y) / 2;
  }

  return z;
}

fun exp(x: Int): Int {
  let sum: Int = WAD;
  let term: Int = WAD;
  let i: Int = 1;

  // e^(x/WAD) in fixed point via a truncated Taylor expansion.
  while (i < 40) {
    term = mulDiv(term, x, WAD * i);
    sum = sum + term;
    i = i + 1;
  }

  return sum;
}

fun ln(x: Int): Int {
  require(x > 0, 203);

  let y: Int = x;
  let k: Int = 0;

  // Bring y into [1, 2) * WAD by powers of two to improve convergence.
  while (y >= 2 * WAD) {
    y = y / 2;
    k = k + 1;
  }

  while (y < WAD) {
    y = y * 2;
    k = k - 1;
  }

  // Mercator-like transform: ln(y)=2*(z + z^3/3 + z^5/5 + ...)
  let z: Int = mulDiv(y - WAD, WAD, y + WAD);
  let z2: Int = mulDiv(z, z, WAD);
  let term: Int = z;
  let series: Int = term;
  let n: Int = 3;

  while (n < 31) {
    term = mulDiv(term, z2, WAD);
    series = series + (term / n);
    n = n + 2;
  }

  return (2 * series) + (k * LN2_WAD);
}
