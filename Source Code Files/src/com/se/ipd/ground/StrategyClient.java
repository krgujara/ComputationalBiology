package com.se.ipd.ground;

import com.se.ipd.Defector;
import com.se.ipd.Cooperator;
import com.se.ipd.Organizer;
import com.se.ipd.TitForTat;

public class StrategyClient {

	public static void main(String[] args) {
		Organizer organizer = new Organizer();
		int generations = 20;
		//****************** DEFECTOR********************
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		organizer.add(new Defector());
		//****************** TIT FOR TAT********************
		organizer.add(new TitForTat());
		organizer.add(new TitForTat());
		organizer.add(new TitForTat());
		organizer.add(new TitForTat());
//		organizer.add(new TitForTat());
		//****************** COOPERATOR********************
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());
		organizer.add(new Cooperator());

		organizer.runGenerations(generations);
	}

}
