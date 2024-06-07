import Component from "@glimmer/component";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { tracked } from "@glimmer/tracking";

export default class SampleList extends Component {
  @service store;

  @tracked featuredTagTopics = [];

  @action
  async getTopics() {

    const topicList = await this.store.findFiltered("topicList", {
      filter: "latest",
      params: {
        tags: ['featured'],
      },
    });

    this.featuredTagTopics = topicList.topics.slice(0, 3);
    console.log(this.featuredTagTopics);
  }

  <template>
    <div class="sample-list" {{didInsert this.getTopics}}>
      <h3>Sample List</h3>
          <div class="featured-topics">
            {{#each this.featuredTagTopics as |t|}}
              <div class="featured-topic">
                <h3>
                    {{t.fancy_title}}
                </h3>

                {{t.tags}}
              </div>
            {{/each}}
          </div>
    </div>
  </template>
}
