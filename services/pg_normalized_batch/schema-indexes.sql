SET maintenance_work_mem = '2GB';
SET max_parallel_maintenance_workers = 4;
CREATE INDEX idx_tweets_id_tweets_lang ON tweets (id_tweets, lang);
CREATE INDEX idx_tweet_tags_id_tweets ON tweet_tags (id_tweets);
CREATE INDEX idx_tweets_lang ON tweets (lang);
CREATE INDEX idx_tweets_text_lang_gin ON tweets USING GIN(to_tsvector('english', text)) WHERE lang = 'en';

RAISE NOTICE  'Finished creating all indexes';
