
# simulate new data -------------------------------------------------------

# function to simulate mod.format_b1

sim_format_b1 = function(n, sims){
  p_vals = numeric(length = sims)
  
  sim_a = expand_grid(
    proid = as.character(1:n),
    item = c(1:33),
    format = "Adjective\nOnly"
  )

  sim_b = expand_grid(
    proid = as.character((n+1):(2*n)),
    item = c(1:33),
    format = "Am\nAdjective"
  )
  
  sim_c = expand_grid(
    proid = as.character(((2*n)+1):(3*n)),
    item = c(1:33),
    format = "Tend to be\nAdjective"
  )
  sim_d = expand_grid(
    proid = as.character(((3*n)+1):(4*n)),
    item = c(1:33),
    format = "I am someone\nwho tends to be\nAdjective"
  )
  
  sim_data = rbind(sim_a, sim_b) %>% rbind(sim_c) %>% rbind(sim_d)
  for (i in 1:sims){
    sim_data$response = simulate(mod.format_b1, newdata = sim_data, allow.new.levels = T)[,1]
    sim_mod = lmer(response~format + (1|proid), data = sim_data)
    p_vals[i] = anova(sim_mod)["format", 6]}
  return(p_vals)
}

# simulate at various sample sizes
# n = number per condition

sample_sizes = seq(50, 500, 25)

n_sims = 1000

power_df = data.frame(
  N = sample_sizes,
  power = 0
)

start = Sys.time()
for(i in sample_sizes){
  pvalues = sim_format_b1(i, n_sims)
  sig = ifelse(pvalues < .05, 1, 0)
  power_df$power[power_df$N == i] <- sum(sig)/n_sims
}
end = Sys.time()
total = end-start

save(power_df, file = here("objects/power_format_b1.Rdata"))
