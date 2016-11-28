using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SaGoFit.Startup))]
namespace SaGoFit
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
