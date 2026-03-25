#set text(
  lang: "es",
  region: "mx",
)

#let today = datetime.today().display()

#import "@preview/physica:0.9.8": pdv

#let last-date = state("last-date", none)

#let class-entry(date: none, body) = block(breakable: true)[
  #context {
    if date != none and date != last-date.get() {
      v(1em)
      text(weight: "bold", size: 1.2em, fill: blue.darken(20%))[#date]
      v(0.5em)

      last-date.update(date)
    }
  }

  #body
]

#let definition(title: none, body) = block(
  fill: luma(245), // Light gray background
  inset: 10pt, // Padding inside the block
  radius: 5pt, // Rounded corners
  width: 100%,
  breakable: true,
)[
  // If a custom title is provided, print it; otherwise just print "Definition."
  *#if title != none [#title] else [Definition].* #body
]

#let Log = math.op("Log")

= Notas de Variable Compleja

#class-entry(date: "2026-03-23")[
  Este día vimos los límites al infinito con algunos ejemplos, i.e.

  $display(lim_(z arrow 0) frac(1, z) &= infinity), \
  display(lim_(z arrow infinity) z &= infinity), \
  display(lim_(z arrow infinity) z_0 &= z_0).$

  Algunas definiciones:

  #definition()[
    Sea $f: A subset.eq CC -> CC$.

    - Decimos que $limits(lim)_(z -> oo) f(z) = L$ si $forall M > 0$ $exists delta > 0$
      tal que si $forall z in A$ si $0 < abs(z - z_0) < delta$, entonces $f(z) < M.$
    - Si $A = CC$, decimos que $limits(lim)_(z -> oo) f(z) = L$ si $forall epsilon > 0$
      $exists R > 0$ tal que si $abs(z) > R$ entonces $abs(f(z) - L) < epsilon$.
    - Si $A = CC$, decimos que $limits(lim)_(z -> oo) f(z) = L$ si $forall M > 0$
      $exists R > 0$ tal que si $abs(z) > R$ entonces $abs(f(z)) > M$.
  ]


  Además, se resolvió el ejercicio 24 de la lista de ejercicios, el cual consistía en
  mostar que la función $f(z)$ estaba acotada por $ell$. Así, como se revisitó la
  definición de $Log(z)$, el cual está definido como

  $Log(z) = {z in CC | log(abs(z)) + i(arg(z) + 2k pi), k in ZZ}.$

  Y a partir de esta definición se definió al conjunto $Log(1)$, i.e.

  $Log(1) &= {log(abs(1)) + i(arg(0) + 2k pi), k in ZZ},\
  &= {0 + i(0 + 2k pi), k in ZZ},\
  Log(1) &= {2k i pi, k in ZZ}.$
]

#class-entry(date: "2026-03-24")[
  Este día continuamos resolviendo el ejercicio 14 de la guía de problemas. Así como el
  ejercicio y se hizo hincampié en las definiciones de $Log$ y la rama principal $log$.

  Además, se resolvió someramente el ejercicio 11 el cual se pedía demostrar que la
  transformación de Möbius que cumplía que $T(z) = 0$ y $abs(T(z) - T(w)) = abs(z - w)$
  era $T(z) = c z$ para alguna $c in SS^1$.

  Después, se comenzó a explicar la noción de derivadas pasando con las definiciones
  de la derivada en $RR$ y $R^n$, para finalmente dar la definición de derivada en $CC$,
  dada por

  #definition()[
    Decimos que una función $f: U subset.eq CC -> CC$ es derivable en $z_0 in U$ si

    #math.equation(block: true, $lim_(h -> 0) frac(f(z_0 + h) - f(h), h)$)

    existe y a este límite se le denota como $f^prime (z_0)$.
  ]

  Además, se habló que en $RR$ solo teníamos dos formas de acercanos al punto, mientras
  que $CC$ tenemos una infinidad de formas de aproximarnos a ese punto.


  Finalmente, se mencionó que una función es derivable si se cumple que

  #math.equation(
    block: true,
    $pdv(u(x,y), x) = pdv(v(x,y), y) quad and quad pdv(u(x, y), y) = -
    pdv(v(x, y), x).$,
  )
]

#class-entry(date: today)[
  Esta vez voy a agregar una definición que leí antes de irme a clase.

  #definition()[
    Decimos que ${z_n}$ es convergente a $beta$ si y solo si

    #math.equation(block: true, $lim_(z -> z_0) {z_n} = beta in CC$)

    esto es que $forall epsilon > 0$ $exists N in NN$ tal que $N < n$ entonces $abs(z_n - beta) < epsilon$.
  ]
]
