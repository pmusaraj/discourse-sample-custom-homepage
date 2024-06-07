import { apiInitializer } from "discourse/lib/api";
import CustomHomepage from "../components/custom-homepage";

export default apiInitializer("1.15.0", (api) => {
  api.renderInOutlet("custom-homepage", CustomHomepage);
});
