#import "@preview/cheq:0.3.0": checklist

#let c-done = counter("c-done")
#let c-pending = counter("c-pending")
#let c-partial = counter("c-partial")
#let c-canceled = counter("c-canceled")

#let get-text(c) = {
  if type(c) == str { c } else if type(c) == content {
    if c.func() == text { c.text } else if c.has("children") { c.children.map(get-text).join("") } else if c.has(
      "body",
    ) { get-text(c.body) } else { "" }
  } else { "" }
}

#show: checklist

#show list.item: it => {
  let t = get-text(it.body)

  if t.starts-with("[x]") or t.starts-with("[X]") { c-done.step() } // FIXED: Because get-text strips space elements, "[ ]" becomes "[]"
  else if t.starts-with("[]") { c-pending.step() } else if t.starts-with("[/]") {
    c-partial.step()
  } else if t.starts-with("[-]") { c-canceled.step() }

  it
}


= Resumen de Ejercicios

#context [
  #let done = c-done.final().first()
  #let pending = c-pending.final().first()
  #let partial = c-partial.final().first()
  #let canceled = c-canceled.final().first()
  #let total = done + pending + partial + canceled

  *Progreso:* ✅ #done #h(1em)
  ⬜ #pending #h(1em)
  🚧 #partial #h(1em)
  ❌ #canceled #h(2em)
  *Total:* #total
]
#line(length: 100%)

= Lista de ejercicios


- [x] Problema 1
- [x] Problema 2
- [x] Problema 3
- [x] Problema 4
- [x] Problema 5
- [x] Problema 6
- [ ] Problema 7
- [ ] Problema 8
- [x] Problema 9
- [x] Problema 10
- [x] Problema 11
- [x] Problema 12
- [x] Problema 13
- [ ] Problema 14
- [ ] Problema 15
- [ ] Problema 16
- [ ] Problema 17
- [ ] Problema 18
- [ ] Problema 19
- [ ] Problema 20
- [ ] Problema 21
- [ ] Problema 22
- [ ] Problema 23
- [x] Problema 24
- [ ] Problema 25
