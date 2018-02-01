package com.se.ipd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class Organizer {
	private List<Strategy> strategies = new ArrayList<Strategy>();
	private Map<String, Integer> pointsMap = new HashMap<String, Integer>();
	private double totalPoints = 0;

	public void runGenerations(int g) {
		organize();

		for (int i = 0; i < g; i++) {
			// FOR EACH GENERATION
			int totalStrategies = strategies.size();
			strategies.clear();
			for (Entry<String, Integer> entry : pointsMap.entrySet()) {
				double pointsEarnedByStrategy = (double) entry.getValue();
				double fractionOfPointsByStrategy = pointsEarnedByStrategy/ totalPoints;
				long population = Math.round(totalStrategies*fractionOfPointsByStrategy);
				
				System.out.print(entry.getKey() + " \t" + population + " \t");
				for (int ind = 0; ind < population; ind++) {
					if ("COPERATOR".equals(entry.getKey())) {
						strategies.add(new Cooperator());
					} else if ("DEFECTOR".equals(entry.getKey())) {
						strategies.add(new Defector());
					} else if ("TFT".equals(entry.getKey())) {
						strategies.add(new TitForTat());
					}
				}
			}
			System.out.println();
			totalPoints = 0;
			pointsMap.clear();
			organize();
		}
	}

	public void add(Strategy strategy) {
		strategies.add(strategy);
	}

	public void organize() {
		for (int i = 0; i < strategies.size(); i++) {
			for (int j = i + 1; j < strategies.size(); j++) {
				for (int k = 0; k < 100; k++) {
					// THIS IS FOR ITERATED PD
					play(strategies.get(i), strategies.get(j));
				}
				strategies.get(i).setLastResponse(null);
				strategies.get(j).setLastResponse(null);
			}
		}

		for (Strategy strategy : strategies) {
			Integer points = pointsMap.get(strategy.getName());
			if (points == null) {
				pointsMap.put(strategy.getName(), strategy.getScore());
			} else {
				pointsMap.put(strategy.getName(),
						points.intValue() + strategy.getScore());
			}
			totalPoints += strategy.getScore();
		}
	}

	public void play(Strategy strategy1, Strategy strategy2) {
		Response respFromFirst = strategy1.respond();
		Response respfromSecond = strategy2.respond();
		strategy1.setLastResponse(respfromSecond);
		strategy2.setLastResponse(respFromFirst);
		if (respFromFirst.equals(Response.COOPERATE)) {
			if (respfromSecond.equals(Response.COOPERATE)) {
				strategy1.addPoints(3);
				strategy2.addPoints(3);
			} else {
				strategy1.addPoints(0);
				strategy2.addPoints(5);
			}
		} else {
			if (respfromSecond.equals(Response.COOPERATE)) {
				strategy1.addPoints(5);
				strategy2.addPoints(0);
			} else {
				strategy1.addPoints(1);
				strategy2.addPoints(1);
			}
		}
	}
}
