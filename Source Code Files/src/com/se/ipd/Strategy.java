package com.se.ipd;

public abstract class Strategy {
	private int score = 0;
	private Response lastResponse = null;
	private String name;
	
	public Strategy(String name) {
		super();
		this.name = name;
	}

	public void addPoints(int points) {
		score += points;
	}

	public int getScore() {
		return score;
	}

	public abstract Response respond();

	public Response getLastResponse() {
		return lastResponse;
	}

	public void setLastResponse(Response lastResponse) {
		this.lastResponse = lastResponse;
	}

	public String getName() {
		return name;
	}

}
