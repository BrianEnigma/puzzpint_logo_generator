import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.providers.Microsoft;
import de.fhpotsdam.unfolding.providers.EsriProvider;
import de.fhpotsdam.unfolding.providers.Google;
import de.fhpotsdam.unfolding.providers.GeoMapApp;
import de.fhpotsdam.unfolding.providers.ImmoScout;
import de.fhpotsdam.unfolding.providers.MapBox;
import de.fhpotsdam.unfolding.utils.*;
import java.util.*;

UnfoldingMap map;
List locations = new Vector();
int theProvider = 0;

void setProvider(int theProvider)
{
    //if (null != map)
    //    MapUtils.removeDefaultEventDispatcher(map);
    map = null;
    switch(theProvider)
    {
        case 1:
            map = new UnfoldingMap(this, new Microsoft.AerialProvider());
            break;
        case 2:
            map = new UnfoldingMap(this, new OpenStreetMap.OSMGrayProvider());
            break;
        case 3:
            map = new UnfoldingMap(this, new EsriProvider.DeLorme());
            break;
        case 4:
            map = new UnfoldingMap(this, new EsriProvider.NatGeoWorldMap());
            break;
        case 5:
            map = new UnfoldingMap(this, new EsriProvider.WorldGrayCanvas());
            break;
        case 6:
            map = new UnfoldingMap(this, new EsriProvider.WorldTerrain());
            break;
        case 7:
            map = new UnfoldingMap(this, new EsriProvider.WorldPhysical());
            break;
        case 8:
            map = new UnfoldingMap(this, new EsriProvider.WorldTopoMap());
            break;
        case 9:
            map = new UnfoldingMap(this, new Google.GoogleMapProvider());
            break;
        case 10:
            map = new UnfoldingMap(this, new Google.GoogleSimplifiedProvider());
            break;
        case 11:
            map = new UnfoldingMap(this, new Google.GoogleSimplified2Provider());
            break;
        case 12:
            map = new UnfoldingMap(this, new GeoMapApp.TopologicalGeoMapProvider());
            break;
        case 13:
            map = new UnfoldingMap(this, new Microsoft.HybridProvider());
            break;
        case 14:
            map = new UnfoldingMap(this, new OpenMapSurferProvider.Grayscale());
            break;
        case 15:
            map = new UnfoldingMap(this, new OpenStreetMap.OpenStreetMapProvider());
            break;
        case 0:
        default:
            map = new UnfoldingMap(this);
            break;
    }
    MapUtils.createDefaultEventDispatcher(this, map);
    map.zoomAndPanToFit(locations);
}

void setup() 
{
    size(1100, 500, P2D);
    locations.add(new Location(49, -125));
    locations.add(new Location(24, -65));
    setProvider(theProvider);
}

void mouseClicked()
{
    if (16 == theProvider)
        exit();
    String filename = String.format("map%02d.png", theProvider);
    save(filename);
    theProvider++;
    setProvider(theProvider);
}

void draw() 
{
  background(0);

  map.draw();

  noStroke();
  fill(215, 0, 0, 100);

  // Shows geo-location at mouse position
    if (false)
    {
        Location location = map.getLocation(mouseX, mouseY);
        text(location.toString(), mouseX, mouseY);
    }

    if (true)
    {
        if (map.allTilesLoaded())
            mouseClicked();
    }
}
