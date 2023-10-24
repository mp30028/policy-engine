package com.zonesoft.tryouts.json_serialisation;
class ExampleParent {
	private int id;
	private String label;
	private ExampleChild child;
	
	public ExampleParent() {
		super();
	}
	
	public ExampleParent(int id, String label, ExampleChild child) {
		super();
		this.id = id;
		this.label = label;
		this.child = child;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getLabel() {
		return label;
	}
	
	public void setLabel(String label) {
		this.label = label;
	}
	
	public ExampleChild getChild() {
		return child;
	}
	
	public void setChild(ExampleChild child) {
		this.child = child;
	}
	
	
}