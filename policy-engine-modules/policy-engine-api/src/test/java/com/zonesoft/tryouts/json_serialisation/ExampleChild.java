package com.zonesoft.tryouts.json_serialisation;

class ExampleChild{
		private int id;
		private String label;
		
		public ExampleChild() {
			super();
		}
		
		public ExampleChild(int id, String label) {
			super();
			this.id = id;
			this.label = label;
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
		
	}