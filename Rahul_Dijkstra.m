#import <Foundation/Foundation.h>
#define Ver 7    // defining total number of vertices
#define Infi 99  // setting infinity value

int Rahul_Dijkstra(int Graph[][Ver],int source,int target) // function(with 3 required arguments)
{
    int dist[Ver],prev[Ver],selected[Ver]={0},i,j,min,d,start,m; // creating the vertex set
    char path[Ver];                             // Q --> vertex set
    for(i=1;i<Ver;i++)  // iterating for each vertex
    {
        dist[Ver]=Infi;     //setting unknown distance to vertex and
        prev[Ver]=-1;       // previous vertex values to undefined
    }    
    
    /*adding our vertex to Q (initially unvisited nodes)*/
        start=source;       // making the start node as source       
        selected[start]=1;  // assigning the selected node to 1
        dist[start]=0; // assigned distance from source to source 
        
    /* when Q is not empty, we set the minimum(least) distance of vertex as 'u' */    
        while(selected[target]==0)  // checking the target node
        {
            min=Infi;   // setting minimum value to infinity
            m=0;
            for(i=1;i<Ver;i++)  // iterating each vertex
            {
                d = dist[start]+Graph[start][i];    // adding the value of start distance and source node distance 
                if(d<dist[i]&&selected[i]==0)  //if distance of selected node is 0 or the new distance of node is 0
                {
                    dist[i]=d;  // the old distance will be assigned and will be new start
                    prev[i]=start; 
                }
                if(min>dist[i]&&selected[i]==0) //if new min distance is greater than selected node
                {
                min=dist[i];    // old distance(least) will be assigned 
                m=i;
                }
            }
            start=m; // start will change to new
            selected[start]=1; // that particluar node will be new start
        }
         start= target;
         j=0;
         while(start!=1)
         {
             path[j++]=start+7;
             start=prev[start];
         }
          path[j]='\0';
          
         // reverse(path); // could not reverse the function in Objective C
          NSLog(@"%s", path);
          return dist[target]; // returns the distance and previous
}
int main() // default main
{
    int Graph[Ver][Ver],i,j,w,res;    // creating set vertex for calling
    int source, target,x,y; // sample A and B
    NSLog(@"\t The Shortest Path Algorithm  \n\n"); // print
    for(i=1;i< Ver;i++) // iterating each first node
    for(j=1;j< Ver;j++) // and second node
    Graph[i][j] = Infi; // assigning first and second node to infinity
    for(x=1;x< Ver;x++)
    {
        for(y=x+1;y< Ver;y++)
        {
            NSLog(@"Enter the weight of the path between nodes %d and %d: ",x,y);
            scanf("%d",&w); // input for weight between the nodes
            Graph [x][y] = Graph[y][x] = w; // for each vertex
        }
        NSLog(@"\n");
    }
    NSLog(@"\nEnter the source:");
    scanf("%d", &source); // input of current starting
    NSLog(@"\nEnter the target");
    scanf("%d", &target); // input of destination
    res = Rahul_Dijkstra(Graph,source,target); // calling the function
    NSLog(@"\nThe Shortest Path: %d",res);
}
