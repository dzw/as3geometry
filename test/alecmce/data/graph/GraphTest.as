package alecmce.data.graph 
{
	import asunit.asserts.assertTrue;

	/**
	 * @author amceachran
	 */
	public class GraphTest 
	{
		private var graph:Graph;
		
		private var a:Object;
		private var b:Object;
		private var c:Object;

		[Before]
		public function before():void
		{
			a = new MockGraphNode("a");
			b = new MockGraphNode("b");
			c = new MockGraphNode("c");
			graph = new Graph();
		}
		
		[After]
		public function after():void
		{
			a = null;
			
			graph = null;
		}
		
		[Test]
		public function simple_association():void
		{
			graph.joinNodes(a, b);
			assertTrue(graph.areJoined(a, b));
		}
		
		[Test]
		public function divergent_associations():void
		{
			graph.joinNodes(a, b);
			graph.joinNodes(a, c);
			
			assertTrue(graph.areJoined(a, b));
		}
		
		[Test]
		public function convergent_associations():void
		{
			graph.joinNodes(a, b);
			
			assertTrue(graph.areJoined(a, b));
			assertTrue(graph.areJoined(c, b));
		}
		
	}
}