# Verification Report: Agentic AI Applications in Airline Revenue Management

**Document reviewed:** `outputs/agentic-ai-airline-revenue.md`  
**Verification date:** 2026-04-21  
**Reviewer:** Automated citation & source verification

---

## Executive Summary

The literature review is well-structured and substantive, but has **systemic citation formatting issues** and several content gaps. The most critical finding is that the document uses **no numbered inline citations** despite having a numbered References section (1–36). All in-text references use author-year or bare arXiv ID format, making it impossible to trace claims to specific numbered sources without manual cross-referencing. Additionally, 6 references are never cited in the body (orphan references), 4 works cited in the body are missing from References, and 1 specific quantitative claim in the collusion section cannot be verified against the cited source title.

**Issue counts:** 3 FATAL · 11 MAJOR · 9 MINOR

---

## FATAL Issues

### F1. No Numbered Inline Citations Anywhere in Body

**Severity:** FATAL  
**Location:** Entire document

The References section numbers sources [1]–[36], but the body text **never uses numbered inline citations** (e.g., `[1]`, `[8, 11]`). Instead, it uses a mix of:
- Author-year: `(Shihab et al., 2019)`, `Calvano et al. (2020)`
- Bare arXiv IDs: `(arXiv:2602.17203)`
- Title mentions: `"Algorithmic Collusion at Test Time" (2026, arXiv:2602.17203)`

This means there is **no formal linkage** between body claims and numbered reference entries. A reader cannot look up `[4]` in the text because it doesn't appear. The numbering in the References section is decorative only.

**Recommendation:** Convert all in-text citations to numbered format matching the References section, or renumber References to match an author-year bibliography style.

### F2. Quantitative Claim May Not Match Source — "Institutional AI" Collusion Reduction

**Severity:** FATAL  
**Location:** Section 6.2, line ~99

> "reduce LLM agent collusion in Cournot markets from mean tier 3.1 to 1.8"

This specific quantitative claim (tier 3.1 → 1.8) is attributed to arXiv:2601.11369. The Reference [11] title is *"Institutional AI: Governing LLM Collusion in Multi-Agent Cournot Markets via Public Governance Graphs."* While the topic matches, **the specific numeric result (3.1 → 1.8) cannot be independently verified from the reference title or other research files**. If these numbers are inaccurate, this constitutes a factual error in a high-stakes regulatory discussion.

**Recommendation:** Verify the exact numbers against the paper's abstract/results, or soften to qualitative language (e.g., "significantly reduce collusion levels").

### F3. Reference [22] Title/Description Mismatch

**Severity:** FATAL  
**Location:** Section 8 (body) vs. Reference 22

The body text (Section 8) describes arXiv:2510.19895 as:
> "a detailed hallucination taxonomy for OR errors"

But Reference [22] lists the title as:
> "DeepSeek-R1 OR Application Framework"

These descriptions are potentially incompatible. A "hallucination taxonomy for OR errors" and an "OR Application Framework" could refer to different papers, or the reference title may be abbreviated/wrong. This needs verification.

**Recommendation:** Confirm the correct title of arXiv:2510.19895 and reconcile with the body description.

---

## MAJOR Issues

### M1. Orphan References — 6 Numbered References Never Cited in Body

**Severity:** MAJOR  
**Location:** References section

The following references appear in the numbered list but are **never cited or mentioned** anywhere in the body text:

| Ref # | Title | arXiv |
|-------|-------|-------|
| 27 | "A Modular LLM Framework for Explainable Price Outlier Detection" | 2603.20636 |
| 31 | "EconEvals: Benchmarks for LLM Agents in Economic Decision-Making" | 2503.18813 |
| 32 | "DEEPTRAVEL: An End-to-End Agentic RL Framework for Autonomous Travel Planning" | 2509.21842 |
| 33 | "Cleared for Takeoff? Compositional & Conditional Reasoning..." | 2404.04237 |
| 34 | "Market-Bench: Benchmarking LLMs on Economic and Trade Competition" | 2604.05523 |
| 36 | Zhang et al. (2022) "Multi-agent graph convolutional RL for dynamic EV charging pricing" | KDD 2022 |

**Recommendation:** Either integrate these into the body text where relevant or remove them from References. References 33 (flight-booking language agents) and 32 (travel planning) seem particularly relevant and could strengthen Sections 9 or 10.

### M2. Missing from References — Talluri & van Ryzin (2004)

**Severity:** MAJOR  
**Location:** Section 2, body text

> "The standard reference is Talluri & van Ryzin (2004), *The Theory and Practice of Revenue Management*"

This foundational textbook is cited in the body but **does not appear** in the References section. As the "standard reference" for the entire field under review, this omission is significant.

**Recommendation:** Add: Talluri, K. T., & van Ryzin, G. J. (2004). *The Theory and Practice of Revenue Management.* Springer. https://doi.org/10.1007/b139000

### M3. Missing from References — Belobaba (1987, 1992)

**Severity:** MAJOR  
**Location:** Section 3.1, body text

> "EMSRa (Belobaba, 1987) and EMSRb (Belobaba, 1992)"

Both seminal EMSR papers are cited by author-year in the body but are **absent from the References section**. These are foundational to the entire RM field and are explicitly named.

**Recommendation:** Add:
- Belobaba, P. P. (1987). "Air travel demand and airline seat inventory management." PhD dissertation, MIT.
- Belobaba, P. P. (1992). "Optimal vs. heuristic methods for nested seat allocation." AGIFORS Symposium Proceedings.

### M4. Missing from References — arXiv:2510.04303 (Steganographic Collusion Detection)

**Severity:** MAJOR  
**Location:** Section 6.2, line ~103

> "steganographic collusion detection (arXiv:2510.04303)"

This arXiv ID is cited in the body but has **no corresponding entry** in the References section.

**Recommendation:** Add the full bibliographic entry for arXiv:2510.04303 to the References.

### M5. Missing Citation — "namanUIUC / DeepAir Solutions" (Section 5.4)

**Severity:** MAJOR  
**Location:** Section 5.4

> "A separate line of work applies deep RL to airline ancillary pricing (AAP) using feature embeddings and variational autoencoders (namanUIUC, 'DeepAir Solutions')."

This appears to reference a GitHub repository but no URL or formal citation is provided, and it does not appear in References.

**Recommendation:** Add GitHub URL (e.g., `https://github.com/namanUIUC/DeepAirSolutions` or similar) to References, or remove the claim if the source cannot be located.

### M6. Missing Citation — "QuantAgent" (Section 9)

**Severity:** MAJOR  
**Location:** Section 9

> "Given the rapid adoption of agentic AI in retail supply chain (Flowr), financial trading (QuantAgent), and real-time bidding (RTBAgent)..."

"QuantAgent" is mentioned as evidence of agentic AI adoption in financial trading, but it has **no citation or reference entry**. The Flowr and RTBAgent references exist, but QuantAgent does not.

**Recommendation:** Add a citation for QuantAgent or remove the mention.

### M7. Reference [8] Missing URL

**Severity:** MAJOR  
**Location:** Reference 8

> Calvano, E., Calzolari, G., Denicolò, V., & Pastorello, S. (2020). "Artificial Intelligence, Algorithmic Pricing, and Collusion." *American Economic Review*, 110(10), 3267–3297.

This is the only reference without any URL (no DOI, no arXiv, no publisher link). As a landmark paper cited prominently in Section 6.2, it should have a resolvable link.

**Recommendation:** Add: https://doi.org/10.1257/aer.20190623

### M8. Unsupported Claim — "GPT5-mini/nano" in Collusion Paper

**Severity:** MAJOR  
**Location:** Section 6.2, line ~101

> "evaluating collusion stability across Q-learning, UCB, and LLM-based agents (GPT5-mini/nano)"

The mention of specific model names "GPT5-mini/nano" is a factual claim that cannot be verified from the reference title alone (arXiv:2602.17203, "Algorithmic Collusion at Test Time"). If these model names are incorrect, this misrepresents the paper's methodology.

**Recommendation:** Verify model names against the paper or soften to "LLM-based agents."

### M9. Section 2 and 3.1 — Multiple Unsupported Technical Claims

**Severity:** MAJOR  
**Location:** Sections 2 and 3.1

Several specific technical claims lack any citation:
- "deterministic linear programming (DLP) and probabilistic nonlinear programming (PNLP) produce bid prices" (Section 3.1)
- "deregulation of the U.S. airline industry in 1978" (Section 1)
- Descriptions of network RM methods (DLP, bid-price control, displacement-adjusted virtual nesting) in Section 2

These are well-known facts in the RM field, but the document presents them as background without citing any source. The Talluri & van Ryzin (2004) reference would cover most of these, but it is itself missing from References (see M2).

**Recommendation:** Adding Talluri & van Ryzin (2004) to References and citing it for these background claims would resolve most of these.

### M10. Section 5.2 — Specific Simulation Parameters Without Citation

**Severity:** MAJOR
**Location:** Section 5.2

> "20 booking periods, 20-seat capacity, and 5 heterogeneous customer types (rational, family, business, party, early-booking)"

These specific experimental parameters for Lange et al. are stated without a formal publication citation. Reference [4] points to a GitHub repository, not a paper. The 5 customer type names are very specific and should be verifiable.

**Recommendation:** Verify these parameters match the GitHub repo documentation, or flag as approximate.

### M11. "Agentic Dynamic Pricing" Empty GitHub Repository Claim

**Severity:** MAJOR  
**Location:** Section 9

> "an empty GitHub repository titled 'Agentic Dynamic Pricing' describing 'AI-powered dynamic pricing simulator for airline ticketing using multi-agent architecture with Gemini LLM' — but no code was committed at time of inspection"

This specific claim about a GitHub repository is unsourced — no URL is provided, and the repository is not in References. This makes the claim unverifiable.

**Recommendation:** Add the GitHub URL or remove the claim.

---

## MINOR Issues

### m1. Reference [7] — Incomplete Bibliographic Entry

**Severity:** MINOR  
**Location:** Reference 7

> "Competitive Multi-Operator RL for Joint Pricing and Fleet Rebalancing in AMoD Systems (2026). arXiv:2603.05000."

No authors are listed. All other references include at least partial author information or a quoted title.

### m2. References [4] and [5] — "est. 2023–2024" Dating

**Severity:** MINOR  
**Location:** References 4, 5

Both use estimated dates "(est. 2023–2024)" which is unusual for a bibliography. If publication dates cannot be confirmed, note the uncertainty differently (e.g., "n.d." or "[ca. 2024]").

### m3. Inconsistent Citation Formatting in Body

**Severity:** MINOR  
**Location:** Throughout

The body mixes three citation styles:
1. Author-year parenthetical: `(Shihab et al., 2019)`
2. arXiv ID only: `(arXiv:2602.03318)`
3. Title + year + arXiv: `**"Algorithmic Collusion at Test Time"** (2026, arXiv:2602.17203)`

A single consistent format should be used throughout.

### m4. Section 4 — Forward References Without Citation Numbers

**Severity:** MINOR  
**Location:** Section 4

> "e.g., OR-LLM-Agent, MIRROR" and "e.g., Flowr, SOLID"

These are mentioned as examples of architectural categories but without any citation. They are cited in later sections, but the first mention should include a reference.

### m5. Reference Grouping Headers Not Standard

**Severity:** MINOR  
**Location:** References section

The References section uses subheadings ("Airline RM with RL Agents", "Multi-Agent RL for Transport Pricing", etc.) which is unusual for a numbered reference list. This is a stylistic choice but could cause confusion if references are cited by number.

### m6. arXiv ID Format — All Appear Well-Formed

**Severity:** MINOR (positive finding)  
**Location:** All arXiv URLs

All arXiv URLs follow the correct format `https://arxiv.org/abs/XXXX.XXXXX`. The DOI in Reference [2] (`https://doi.org/10.1057/s41272-021-00327-w`) and the ACM DL URL in Reference [36] are also properly formatted. No malformed URLs detected.

### m7. GitHub URLs — Cannot Verify Liveness

**Severity:** MINOR  
**Location:** References 3, 4, 5

Three references point to GitHub repositories:
- [3]: `https://github.com/syedshihab/deep-airline-revenue-management`
- [4]: `https://github.com/fabianlange18/AirlineSimulation`
- [5]: `https://github.com/lanyangyang66/The-code-of-paper--Reinforcement-Learning-for-Multi-Flight-Dynamic-Pricing`

URLs are well-formed but liveness cannot be verified without direct access.

### m8. "American Economic Review" — Volume/Issue Consistent

**Severity:** MINOR (positive finding)  
**Location:** Reference [8] and Section 6.2

Body states "American Economic Review 110(10), 3267–3297" and Reference [8] confirms the same. Consistent.

### m9. Section 12 Conclusion — Broad Claims Without Specific Citations

**Severity:** MINOR  
**Location:** Section 12

The conclusion makes sweeping summary claims ("The RL-based foundations are established," "production deployments in retail supply chain and real-time bidding demonstrate that agentic AI can operate at scale") without specific citations. While these summarize earlier cited material, best practice would include back-references to the relevant sections or citation numbers.

---

## Summary Table

| Severity | Count | Category |
|----------|-------|----------|
| FATAL | 3 | Wrong/unverifiable facts, title mismatch |
| MAJOR | 11 | Missing citations, orphan references, unsourced claims |
| MINOR | 9 | Formatting, style, positive findings |
| **Total** | **23** | |

## Priority Recommendations

1. **Convert to numbered inline citations** — This is the single highest-impact fix. Every `(arXiv:XXXX.XXXXX)` and `(Author et al., Year)` should become `[N]` matching the References.
2. **Add missing references** — Talluri & van Ryzin (2004), Belobaba (1987, 1992), arXiv:2510.04303, QuantAgent, and the empty GitHub repo URL.
3. **Remove or integrate orphan references** — References 27, 31, 32, 33, 34, 36 are never cited.
4. **Verify quantitative claims** — The collusion tier numbers (F2) and GPT5-mini/nano model names (M8) need source verification.
5. **Add URL for Calvano et al.** — Reference [8] needs a DOI link.
6. **Reconcile Reference [22] title** — Confirm whether "DeepSeek-R1 OR Application Framework" is the correct title for a "hallucination taxonomy" paper.
