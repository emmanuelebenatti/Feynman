# Peer Review: Agentic AI Applications in Airline Revenue Management

**Reviewer type:** Adversarial audit / verification pass  
**Date:** 2026-04-21  
**Document reviewed:** `outputs/agentic-ai-airline-revenue.md`

---

## Part 1: Structured Review

## Summary

This literature review surveys the intersection of agentic AI (autonomous, goal-directed AI systems with planning and tool-use capabilities) and airline revenue management (RM). The paper's central finding is a *negative result*: no published work directly applies LLM-based agentic AI to airline RM as of April 2026, though RL-based autonomous pricing agents are established in simulation, and enabling technologies from adjacent domains (supply chain, OR automation, real-time bidding) are transferable. The review also catalogs algorithmic collusion as a key regulatory risk and proposes a five-point research agenda.

The review is well-structured and refreshingly honest about the gap between what exists and what is claimed. However, it has significant issues with citation verifiability, overclaiming transferability, single-source dependencies for core claims, and several sections that are thinner than they appear.

## Strengths

- [S1] **Honest framing of the negative result.** The abstract and conclusion clearly state that no published work combines agentic AI with airline RM. This is commendable and unusual — many reviews would overstate the evidence. The "Draft — pending citation verification" status header is appropriately cautious.

- [S2] **Useful organizational spectrum.** The progression from classical RM → RL agents → LLM-based agentic systems (Section 4) provides a clear conceptual framework. The three-category taxonomy (RL-based, LLM-based, hybrid) is serviceable.

- [S3] **Algorithmic collusion coverage is the strongest section.** Section 6.2 cites six distinct works spanning 2020–2026 across RL and LLM paradigms, includes a landmark AER publication (Calvano et al., 2020), and directly connects to airline-specific regulatory risk. This is the most evidence-dense section.

- [S4] **Transparent about vendor access limitations.** Section 9 explicitly discloses that vendor websites were blocked and marks its industry inference as "low confidence." This is appropriate epistemic hygiene.

## Weaknesses

- [W1] **MAJOR: Citation verifiability is systematically weak.** Multiple references lack full author names, use estimated dates ("est. 2023–2024"), or cite only GitHub repositories without associated papers. References 4 and 5 (Lange et al., Lan et al.) have no confirmed publication venue, no DOI, and hedged dates. Reference for the ancillary revenue work (Section 5.4) cites "namanUIUC, 'DeepAir Solutions'" — a GitHub handle, not a citable source. At least 8 of 36 references cannot be independently verified from the information provided. For a literature review, citation integrity is foundational.

- [W2] **MAJOR: Transferability claims are asserted, not argued.** Sections 7.1–7.4 repeatedly state that architectures are "directly transferable" or "directly applicable" to airline RM without substantive analysis of *what would need to change*. The review never engages with the specific technical barriers to transfer: airline fare filing constraints (ATPCO tariff rules), GDS integration complexity, the multi-channel distribution problem, or the regulatory regime differences between retail supply chain and commercial aviation. Calling something "directly transferable" is a strong technical claim requiring evidence.

- [W3] **MAJOR: DeepARM carries disproportionate weight.** The entire case that "RL-based foundations are established" (Conclusion) rests primarily on the DeepARM system (Shihab et al., 2019/2022). This is a single research group's work, evaluated only in a single-leg simulation with stylized demand. Sections 5.2–5.4 attempt to broaden the evidence base but cite unpublished GitHub repositories (W1). The review's central positive claim — that autonomous RL agents "can learn competitive pricing and inventory control policies" — is a single-source critical finding dressed up with thin supporting evidence.

- [W4] **MAJOR: The "agentic AI" definition is unfalsifiable as applied.** Section 4 defines agentic AI with five criteria (autonomous goals, multi-step planning, tool use, memory, self-correction). But the review then applies the term loosely: DRL agents in Section 5 satisfy at most criterion (i), yet are treated as part of the agentic spectrum. The review acknowledges this ("'agentic' in the sense of autonomous decision-making but typically lack natural-language reasoning or tool use") but then proceeds to count them as evidence for agentic AI in airline RM. This conflation inflates the evidence base.

- [W5] **MINOR: Sections 2 and 3 are zombie sections.** They summarize textbook RM content (EMSR, DLP, bid prices) that any reader of this review would already know. Section 3.2 ("Machine Learning in RM") is a single paragraph with no citations beyond the implicit Talluri & van Ryzin reference. These sections consume ~15% of the document but contribute no novel synthesis. They should either be cut to a paragraph or enriched with specific citations to recent ML-for-RM work (e.g., Fiig et al. on DAVN, Weatherford on unconstraining).

- [W6] **MINOR: Section 8 is a grab-bag with weak integration.** "LLM Agent Behavior in Economic Settings" presents three bullet points on market behavior, cognitive biases, and OR problem-solving capability. These findings are not connected to each other or to a coherent argument about airline RM implications beyond one-sentence asides. The section reads like leftover search results that needed a home.

- [W7] **MINOR: The research agenda (Section 11) is generic.** All five proposed directions are predictable from the gaps identified. None leverages the specific synthesis of the review to propose something non-obvious. "Develop a standardized benchmark" and "partner with airlines for validation" are boilerplate. A stronger research agenda would identify *specific* architectural decisions (e.g., which SOLID component handles fare-class nesting, how collusion governance integrates with real-time bid-price updates).

- [W8] **MINOR: Missing systematic search methodology.** The review provides no description of how literature was identified — no search terms, databases queried, inclusion/exclusion criteria, or PRISMA-style flow diagram. This is standard for systematic reviews and its absence makes it impossible to assess completeness or selection bias.

- [W9] **MINOR: The abstract overclaims the collusion finding.** The abstract identifies algorithmic collusion as "a critical regulatory risk." While Section 6.2 provides good evidence of collusion in abstract pricing games, none of the cited collusion studies use airline-specific market structures (differentiated products with network effects, advance purchase, fare classes). The leap from Bertrand oligopoly to airline markets is non-trivial and is not discussed.

- [W10] **MINOR: No discussion of data availability or ethical considerations.** Airline booking data is proprietary and sensitive. Any research agenda for agentic airline RM must confront data access barriers, privacy constraints, and the ethics of autonomous pricing (e.g., price discrimination, consumer welfare). These are completely absent.

## Questions for Authors

- [Q1] For references 4 and 5 (Lange et al., Lan et al.): Can you confirm these are published or under review at a peer-reviewed venue? If they are only GitHub repositories, they should be clearly labeled as such and their findings weighted accordingly.

- [Q2] The review states DeepARM achieves revenue "comparable to or exceeding" EMSRb. What is the magnitude of the difference? Is it statistically significant? The vagueness here matters: a 0.1% improvement in simulation is very different from a 5% improvement.

- [Q3] Section 7 claims multiple architectures are "directly transferable." Can you identify one specific technical obstacle that would need to be overcome for each transfer? For example, how would SOLID's ADMM-inspired coordinator handle the discrete, combinatorial nature of fare-class availability (booking classes are opened/closed, not continuously adjusted)?

- [Q4] The empty GitHub repository for "Agentic Dynamic Pricing" (Section 9) — what information exactly was available? Was there a README, description, or any metadata beyond the title? Citing an empty repository as evidence of industry interest is a stretch.

- [Q5] How were the 36 references selected? Was there a systematic search, or were these found through citation chaining from seed papers? The review cites works from 2024–2026 heavily but has very thin coverage of the 2015–2023 period where significant ML-for-RM work occurred (e.g., Fiig et al., Weatherford, McGill & van Ryzin survey updates).

## Verdict

**Overall assessment:** This is a competent *first draft* of a scoping review that identifies a genuine gap (no agentic AI for airline RM) and provides useful coverage of adjacent work. The algorithmic collusion section is publication-ready. However, the review has three major issues that prevent it from being publishable in its current form:

1. Citation verifiability (W1) — multiple references cannot be independently checked.
2. Unsupported transferability claims (W2) — the core value proposition is asserted, not demonstrated.
3. Single-source dependency for the central positive claim (W3) — DeepARM alone cannot establish that "RL-based foundations are established."

**Confidence:** 7/10. The issues identified are clearly present in the text.

**Venue assessment:** In current form, this would be a **desk reject** at a top venue (IJRM, OR, Management Science) due to W1 and W8. With revisions addressing W1–W4, it could be competitive at a workshop (AGILE, INFORMS RM section) or a survey-oriented venue (European Journal of OR survey section). The negative result itself — documenting what *doesn't* exist — has value if the methodology is rigorous.

## Revision Plan

**Priority 1 (must-fix):**
1. **Verify all citations (W1).** Confirm arXiv IDs resolve, author names are correct, and publication venues/dates are accurate. Remove or explicitly flag any reference that is GitHub-only. Add DOIs where available.
2. **Add search methodology (W8).** Document databases searched, query terms, date range, inclusion/exclusion criteria. This is table stakes for a literature review.
3. **Substantiate transferability claims (W2).** For each "directly transferable" architecture in Section 7, add a paragraph analyzing: (a) what specifically transfers, (b) what technical modifications are needed, and (c) what airline-specific constraints the original system does not address.

**Priority 2 (should-fix):**
4. **Broaden the RL evidence base (W3).** Search for additional RL-for-airline-pricing work beyond DeepARM. If no additional peer-reviewed work exists, state this explicitly and temper the claim about "established foundations."
5. **Tighten the agentic AI definition (W4).** Either exclude RL agents from the agentic framing or create a clear "levels of agency" taxonomy and consistently apply it.
6. **Compress Sections 2–3 (W5).** Cut to one paragraph each or enrich with specific recent citations.

**Priority 3 (nice-to-fix):**
7. **Restructure Section 8 (W6).** Integrate the LLM behavior findings into relevant earlier sections (collusion → Section 6.2; OR capability → Section 7.1; biases → Section 10.6).
8. **Sharpen the research agenda (W7).** Add technical specificity: which architectural components, which demand models, which regulatory frameworks.
9. **Add a data/ethics subsection (W10).** Brief discussion of data access barriers, privacy, and consumer welfare implications.
10. **Qualify the collusion risk claim (W9).** Note that airline markets differ structurally from the abstract games in the collusion literature and identify what additional validation would be needed.

---

## Part 2: Inline Annotations

> "truly agentic AI systems (LLM-based planning agents, multi-agent orchestration frameworks, autonomous OR solvers) have not yet been directly applied to airline RM in published work"
**[S1] STRENGTH:** This is the most important sentence in the review and it is stated clearly. The honest negative finding gives the review its primary value.

> "deep reinforcement learning (DRL) agents for airline pricing and inventory control are well-established in the academic literature (2019–2025)"
**[W3] MAJOR:** "Well-established" is overclaiming. The primary evidence is one research group (Shihab et al.) with one system (DeepARM) tested in single-leg simulation. References 4 and 5 are unverified GitHub repositories. Three data points — one published, two unverifiable — do not make something "well-established."

> "Lange et al. (est. 2023–2024) systematically compared **10 solution methods**"
**[W1] MAJOR:** "est. 2023–2024" signals this is not a published, peer-reviewed work. The lack of a confirmed date, venue, or full citation undermines the claim. If this is a working paper or thesis, label it as such. If it's only a GitHub repository, its findings should be presented with appropriate caveats about peer review status.

> "Lan et al. (est. 2023–2024) extended single-flight RL to **network-level multi-flight dynamic pricing**"
**[W1] MAJOR:** Same issue as above. Additionally, the review states "details of the network structure and competitive dynamics remain limited based on available code" — acknowledging the evidence is thin while still presenting it as a substantive contribution to the field.

> "A separate line of work applies deep RL to airline ancillary pricing (AAP) using feature embeddings and variational autoencoders (namanUIUC, 'DeepAir Solutions')."
**[W1] MAJOR:** Citing a GitHub handle ("namanUIUC") as an author and a repository name as a title is not acceptable in a literature review. This should either be traced to a proper publication or removed. The review itself calls it "a student-level project" — if so, it does not belong in a literature review unless clearly flagged as grey literature.

> "Directly applicable to automating airline RM model formulation (network optimization, fare-class allocation)."
**[W2] MAJOR:** This claim (about OR-LLM-Agent) asserts direct applicability without analyzing what airline RM model formulation actually requires: fare-class nesting constraints, displacement-adjusted virtual nesting, Q-forecasting interactions, or network LP sparsity patterns. OR-LLM-Agent was demonstrated on textbook OR problems, not aviation-specific optimization. "Potentially applicable with significant domain adaptation" would be more accurate.

> "This architecture maps directly to combining RM solvers with LLM-based contextual reasoning for event-aware pricing."
**[W2] MAJOR:** About SOLID — the word "directly" does unwarranted work here. SOLID uses ADMM for continuous optimization with deviation penalties. Airline RM involves discrete booking-class availability decisions, integer constraints on seat allocations, and fare-filing rules that are inherently non-continuous. The mapping is conceptual at best, not "direct."

> "The architecture pattern (specialized agents + human oversight + MCP) is directly transferable to airline RM operations."
**[W2] MAJOR:** About Flowr — supermarket supply chain and airline RM share some abstract properties (perishable inventory, demand uncertainty) but differ profoundly in distribution channel complexity (GDS vs. direct), pricing mechanism (continuous discounting vs. discrete fare classes), regulatory environment, and competitive dynamics (oligopoly vs. retail competition). Asserting "direct" transferability without addressing these differences is misleading.

> "the DRL agent achieves revenue performance comparable to or exceeding the EMSRb heuristic"
**[Q2]:** The phrase "comparable to or exceeding" is doing a lot of hedging work. What are the actual numbers? The review should report the percentage revenue difference and confidence intervals if available. EMSRb is known to be near-optimal for single-leg problems, so "comparable to" may mean "essentially the same" — which would weaken the case for RL rather than strengthen it.

> "Airlines already face antitrust scrutiny around pricing coordination (DOJ investigations of fare signaling via ATPCO). Deploying autonomous pricing agents that interact in competitive markets creates a new vector for *inadvertent algorithmic collusion*"
**[W9] MINOR:** The connection between the cited collusion literature (Bertrand oligopoly, Cournot markets, double auctions) and airline markets is assumed rather than argued. Airline pricing involves differentiated products (schedule, route, class of service), advance-purchase dynamics, and network effects that fundamentally alter competitive dynamics relative to the homogeneous-good models in Calvano et al. The risk may well be real, but the review should acknowledge the structural gap.

> "Prior to the agentic AI wave, ML was applied to RM primarily for demand forecasting (gradient-boosted trees, neural networks) and customer segmentation."
**[W5] MINOR:** This entire paragraph (Section 3.2) contains zero citations. The ML-for-RM literature is substantial: Fiig et al. on Q-forecasting, Weatherford on unconstraining with ML, Rusmevichientong et al. on dynamic assortment, the PODS community's work on choice-based RM. Dismissing this body of work in one un-cited paragraph misrepresents the field.

> "However, **no peer-reviewed publication or verified open-source project documents a deployed agentic AI system for airline RM from any vendor or airline as of April 2026.**"
**[S4] STRENGTH (with caveat):** This is a strong, falsifiable claim. However, the preceding paragraph names vendors (PROS, Amadeus, Sabre, IBS, FLYR, Fetcherr, Airnguru) and states they "incorporate machine learning" — also without citations. The review should either cite specific vendor publications/press releases or omit the vendor names.

> "Given the rapid adoption of agentic AI in retail supply chain (Flowr), financial trading (QuantAgent), and real-time bidding (RTBAgent), it is plausible that airline RM vendors are developing agentic capabilities internally."
**[W2/Q4] MINOR:** "QuantAgent" appears here but is never cited in the references section. This is either a missing reference or an unsourced claim. Additionally, "rapid adoption" of Flowr is cited from a single arXiv paper about one supermarket deployment — this is not evidence of broad industry adoption.

> "The most urgent concern is algorithmic collusion."
**[W9] MINOR:** "Most urgent" is a strong prioritization claim. For airline practitioners, sim-to-real transfer (Section 10.1) and network scalability (Section 10.2) may be far more urgent practical barriers. The review should either justify this prioritization or present it as one of several co-equal concerns.

> "We adopt the following working definition: an **agentic AI system** is one that (i) pursues goals autonomously, (ii) plans multi-step actions, (iii) uses tools (solvers, APIs, databases), (iv) maintains memory across interactions, and (v) self-corrects based on feedback."
**[W4] MAJOR:** This definition is not attributed to any source. Is it the authors' own? Is it consistent with definitions used by the cited works? The review should cite the provenance (e.g., Shavit et al. 2023, or the AI agent survey literature) and then show how each reviewed system maps against these five criteria — perhaps in a summary table. Without this, the boundary between "agentic" and "not agentic" is drawn ad hoc.

> "the DRL agent achieves revenue performance comparable to or exceeding the EMSRb heuristic — the dominant industry baseline — in a simulated single-leg environment with non-homogeneous Poisson arrivals and beta-distributed willingness-to-pay"
**[W3] MINOR:** EMSRb is the standard *academic* baseline for single-leg RM. Calling it "the dominant industry baseline" may overstate its role in modern airline systems, which increasingly use network-level optimization (DLP/DAVN). This subtly inflates the significance of matching EMSRb.

> "Develop a standardized, open-source airline RM environment that captures network-level complexity (connecting itineraries, fare families, GDS distribution) and supports both RL and LLM-based agents."
**[W7] MINOR:** This is a reasonable but generic proposal. The review could strengthen it by specifying what makes airline RM simulation different from existing RL benchmarks (e.g., PODS, RevSim), what fidelity level is needed, and whether any of the simulation environments already cited (DeepARM, Lange et al.'s AirlineSimulation) could serve as starting points.

---

## Sources

All source URLs are as cited in the reviewed document. External verification of arXiv IDs and GitHub repositories was attempted but blocked by network restrictions during this review. **This is a limitation: the citation verification issues flagged in W1 are based on internal evidence (hedged dates, GitHub-only sources, missing author names) rather than confirmed broken links.**

- Document under review: `outputs/agentic-ai-airline-revenue.md`
- No additional external sources were successfully accessed during this review.
