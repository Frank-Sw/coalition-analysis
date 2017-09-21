```{r calcProbs}
set.seed(31072017)
forsa_13 <- as_survey(
    percent    = c(.40, .26, .10, .05, .09, .02, .04, .04),
    samplesize = 1995,
    parties    = c("cdu", "spd", "greens", "fdp", "left", "pirates", "afd", "others"))

seats_13 <- forsa_13 %>%
    draw_from_posterior(correction = 0.005) %>%
    get_seats(survey=forsa_13)

probs_13 <- seats_13 %>%
    have_majority(
        coalitions = list(
            c("cdu"), c("cdu", "fdp"), c("cdu", "greens"), c("cdu", "fdp", "greens"),
            c("spd"), c("spd", "left"), c("spd", "left", "greens"))) %>%
    calculate_probs(
        coalitions = list(
            c("cdu"), c("cdu", "fdp"), c("cdu", "greens"), c("cdu", "fdp", "greens"),
            c("spd"), c("spd", "left"), c("spd", "left", "greens")))
seats_13 <- mutate(seats_13,
  party= factor(party, levels=c("cdu", "spd", "greens", "fdp", "left", "pirates", "afd", "others"),
    labels=coalitions:::prettify_en(c("cdu", "spd", "greens", "fdp", "left", "pirates", "afd", "others"))))
probs_13 <- mutate(probs_13,
  coalition = factor(coalition, levels=coalition, labels=coalitions:::prettify_en(coalition)))

forsa_13 <- mutate(forsa_13,
  party = factor(party, levels=party, labels=coalitions:::prettify_en(party)),
  percent = percent * 100)
saveRDS(forsa_13, "forsa_13.Rds")
saveRDS(seats_13, "forsa_seats_13.Rds")
saveRDS(probs_13, "forsa_probs_13.Rds")

forsa_tab_1 <- forsa_13[, 1:2] %>%
  select(party=party, share=percent) %>%
  mutate(
    party = factor(party, levels=party, labels=coalitions:::prettify_en(party)),
    share = str_pad(paste0(share * 100, "%"), 3)) %>%
  spread(party, share)
saveRDS(forsa_tab_1, "forsa_tab_1.Rds")


frd_13 <- redistribute(forsa_13) %>%
    transmute(
        party = factor(party, levels=party, prettify_strings(party)),
        share = round(percent, 4)*100,
        seats = sls(votes, party))
saveRDS(frd_13, "forsa_redist_13.Rds")