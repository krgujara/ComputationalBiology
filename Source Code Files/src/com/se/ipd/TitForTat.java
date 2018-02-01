package com.se.ipd;

public class TitForTat extends Strategy{

	public TitForTat() {
		super("TFT");
	}

	@Override
	public Response respond() {
		if (getLastResponse() != null){
			return getLastResponse();
		} else {
			return Response.COOPERATE;
		}
	}

}
