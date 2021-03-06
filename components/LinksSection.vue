<template>
  <section class="section-container">
    <h3 class="section-title">
      Links
    </h3>

    <link-list
      v-for="(linkList, linkListsKey) in linkLists"
      :key="linkListsKey"
      :title="linkList.title"
      :links="linkList.links"
      class="py-2"
    >
    </link-list>
  </section>
</template>

<script lang="ts">
import { defineComponent, computed } from '@vue/composition-api';
import LinkList from './LinkList';
import { Link } from '~/types';

interface LinkListProperty {
  title: string;
  links: Link[];
}

export default defineComponent({
  name: 'LinksSection',
  components: {
    LinkList,
  },
  setup () {
    const socialServiceLinks = computed<Link[]>((): Link[] => {
      return [
        {
          name: 'Twitter (hiroxto)',
          to: 'https://twitter.com/hiroxto',
        },
        {
          name: 'Scrapbox',
          to: 'https://scrapbox.io/hiroxto/',
        },
        {
          name: 'GitHub (hiroxto)',
          to: 'https://github.com/hiroxto',
        },
        {
          name: 'GitLab (hiroxto)',
          to: 'https://gitlab.com/hiroxto',
        },
      ];
    });

    const subDomainLinks = computed<Link[]>((): Link[] => {
      return [
        {
          name: 'utils.hiroxto.net',
          to: 'https://utils.hiroxto.net/',
        },
        {
          name: 'train-photo-blog.hiroxto.net',
          to: 'https://train-photo-blog.hiroxto.net/',
        },
      ];
    });

    const blogLinks = computed<Link[]>((): Link[] => {
      return [
        {
          name: 'Blog',
          to: 'https://hiroto-k.hatenablog.com/',
        },
        {
          name: 'Train photo blog',
          to: 'https://train-photo-blog.hiroxto.net/',
        },
      ];
    });

    const linkLists = computed((): LinkListProperty[] => {
      return [
        {
          title: 'Social',
          links: socialServiceLinks.value,
        },
        {
          title: 'Sub domains',
          links: subDomainLinks.value,
        },
        {
          title: 'Blogs',
          links: blogLinks.value,
        },
      ];
    });

    return {
      linkLists,
    };
  },
});
</script>
