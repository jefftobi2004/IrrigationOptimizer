# Analiza Complexității Algoritmilor de Alocare Optima a Apei

## Descriere
Optimizarea distribuției apei în sistemele de irigații necesită utilizarea unor algoritmi eficienți. Această secțiune analizează complexitatea diferitelor metode utilizate pentru alocarea optimă a resurselor hidrice.

## 1️⃣ Programare Liniară (LP) - Metoda Simplex
**Descriere:**
- Rezolvă un sistem de inegalități liniare pentru a optimiza distribuția apei.
- Se folosește în alocarea apei astfel încât să maximizeze randamentul agricol cu resurse limitate.

**Complexitate:**
- Cazul cel mai nefavorabil: **exponențial** \(O(2^n)\) *(rar în practică)*
- Cazul mediu: **polinomial** \(O(n^3)\) *(cu metode de punct interior)*

**Avantaje:**
✔️ Rapid și eficient pentru probleme de mare dimensiune.  
✔️ Soluții optime garantate pentru funcții liniare.

**Dezavantaje:**
❌ Nu poate trata obiective multiple simultan.  
❌ Sensibil la modificările constrângerilor.

---

## 2️⃣ Optimizare Multi-Obiectiv (MOO) - Metoda Goal Attainment
**Descriere:**
- Optimizează simultan mai multe obiective, de exemplu:
  - Minimiza consumul de apă.
  - Maximiza producția agricolă.

**Complexitate:**
- Depinde de tipul de optimizator:
  - **Metode bazate pe gradient:** \(O(n^2)\) *(mai rapide, dar pot găsi doar optime locale)*
  - **Algoritmi evolutivi (ex. NSGA-II):** \(O(n^2 \cdot m)\), unde \(m\) este dimensiunea populației *(mai robuști, dar mai lenți)*

**Avantaje:**
✔️ Identifică compromisuri între mai multe obiective.  
✔️ Aplicabil pentru probleme complexe din lumea reală.

**Dezavantaje:**
❌ Cost computațional ridicat.  
❌ Necesită parametri suplimentari și ajustări pentru convergență.

---

## 🔎 Concluzie
| Metodă | Complexitate | Avantaje | Dezavantaje |
|--------|-------------|-----------|-------------|
| **LP (Simplex)** | \(O(n^3)\) (în medie) | Rapid, optim garantat | Nu suportă mai multe obiective |
| **MOO (Goal Attainment)** | \(O(n^2) - O(n^2 \cdot m)\) | Suport multi-obiectiv, robust | Computațional intensiv |

📌 **Recomandare:**
- Pentru alocare simplă, **LP** este mai eficient.
- Pentru optimizări complexe, **MOO** oferă rezultate mai bune.

---

## Referințe

1. **Programarea Liniară (Simplex) - Wikipedia**  
   [Programarea Liniară pe Wikipedia](https://ro.wikipedia.org/wiki/Programare_liniar%C4%83)  
   - O resursă generală pentru înțelegerea teoriei programării liniare și a aplicațiilor Simplex.

2. **NSGA-II Algorithm Explained - Towards Data Science**  
   [NSGA-II Algorithm](https://towardsdatascience.com/nsga-ii-algorithm-theory-and-implementation-a5a90d60e17e)  
   - Explicație detaliată despre NSGA-II, un algoritm evolutiv popular în optimizarea multi-obiectiv.

3. **Multi-objective Optimization - GeeksforGeeks**  
   [Multi-objective Optimization](https://www.geeksforgeeks.org/multi-objective-optimization-in-machine-learning/)  
   - O introducere în optimizarea multi-obiectiv, cu exemple și aplicații.
