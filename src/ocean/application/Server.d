/// TODO
module ocean.application.Server;

import ocean.application.Daemon;
import ocean.net.server.connection.IConnectionHandler;
/+
public class Server : Daemon
{
    import ocean.net.server.SelectListener;

    /// TODO
    private class ConnectionHandler : TaskConnectionHandler
    {
        /***********************************************************************

            Constructor

            Params:
                socket = the socket
                error_dg_ = optional user-specified error handler, called when a
                    connection error occurs

        ***********************************************************************/

        // TODO: from outer?
        protected this ( ISocket socket, ErrorDg error_dg_ = null )
        {
            super(socket, error_dg_);
        }

        /***********************************************************************

            Connection handler method, called from a running task.

        ***********************************************************************/

        override protected void handle ( )
        {
            this.outer.conn_handler_dg();
        }
    }

    /// TODO
    private alias SelectListener!(ConnectionHandler) Listener;
    private Listener listener;

    /// TODO
    private alias void delegate ( ) ConnHandlerDg;

    /// TODO
    private ConnHandlerDg conn_handler_dg;

    /// TODO
    public this ( Settings settings, ConnHandlerDg conn_handler_dg )
    {
        super(settings);

        // TODO listener config
        this.listener = new Listener();
        this.conn_handler_dg = conn_handler_dg;
    }

    /// TODO: should include any parsing of args / config required by the app
    protected override int mainAppLogic ( )
    {
        theScheduler.epoll.register(this.listener);
    }
}
+/